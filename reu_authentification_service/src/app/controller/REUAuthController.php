<?php
namespace reu\authentification\app\controller;

use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Slim\Container;
use reu\authentification\app\models\User;
use reu\authentification\app\utils\Writer;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

/**
 * Class REUAuthController
 * @package lbs\command\api\controller
 */
class REUAuthController //extends Controller
{
    private $container;

    public function __construct(Container $container)
    {
        $this->container = $container;
    }

    public function authenticate(Request $rq, Response $rs, $args): Response {

        if (!$rq->hasHeader('Authorization')) {

            $rs = $rs->withHeader('WWW-authenticate', 'Basic realm="users_api api" ');
            return Writer::json_error($rs, 401, 'No Authorization header present');
        };

        $authstring = base64_decode(explode(" ", $rq->getHeader('Authorization')[0])[1]);
        list($email, $pass) = explode(':', $authstring);

        try {
            $user = User::select('id', 'username', 'email', 'password', 'refresh_token', 'created_at', 'description')
                ->where('email', '=', $email)
                ->firstOrFail();

            if (!password_verify($pass, $user->password))
                throw new \Exception("password check failed");

            unset ($user->password);

        } catch (ModelNotFoundException $e) {
            $rs = $rs->withHeader('WWW-authenticate', 'Basic realm="reu authentification" ');
            return Writer::json_error($rs, 401, 'Erreur authentification');
        } catch (\Exception $e) {
            $rs = $rs->withHeader('WWW-authenticate', 'Basic realm="reu authentification" ');
            return Writer::json_error($rs, 401, $e->getMessage());
        }

        $secret = $this->container->settings['secret'];
        $token = JWT::encode(['iss' => 'http://api.authentification.local/auth',
            'aud' => 'http://api.gateway.local',
            'iat' => time(),
            'exp' => time() + (12 * 30 * 24 * 3600),
            'upr' => [
                'email' => $user->email,
                'username' => $user->username,
            ]],
            $secret, 'HS512');

        $user->refresh_token = bin2hex(random_bytes(32));
        $user->save();
        $data = [
            'access-token' => $token,
            'refresh-token' => $user->refresh_token
        ];

        return Writer::json_output($rs, 200, $data);
    }

    public function deleteUser(Request $req, Response $resp, array $args): Response {
        $received_id = $args['id'];
        
        $user = User::find($received_id);

        $date_now= new  \DateTime();
        $date_6months = date('Y-m-d H:i:s', strtotime("+12 months", strtotime( $user['created_at'])));
        $date_convert = new \DateTime($date_6months);

        $diff = date_diff($date_now, $date_convert)->format('%R');
        if($diff == '-'){
            $user->delete();
            $res = "user deleted";
        }else            
            $res = "can't delete user, not expired yet";

        $response =  [
            'status' => $res,
            'user'   => $user
        ];
        $resp->getBody()->write(json_encode($response));
        return writer::json_output($resp, 200);

    }
}