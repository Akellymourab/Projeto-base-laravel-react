<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

/**
 * @OA\Info(
 * version="1.0.0",
 * title="Documentação da API do Meu Projeto Base",
 * description="Descrição da API com Swagger"
 * )
 */
class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    /**
     * @OA\Get(
     * path="/api/hello",
     * operationId="getHelloWorld",
     * tags={"Exemplos"},
     * summary="Retorna uma mensagem de 'Olá, Mundo!'",
     * description="Este é um endpoint de exemplo para testar a documentação.",
     * @OA\Response(
     * response=200,
     * description="Operação bem-sucedida",
     * @OA\JsonContent(
     * type="object",
     * @OA\Property(property="message", type="string", example="Olá, Mundo!")
     * )
     * )
     * )
     */
    public function hello()
    {
        return response()->json(['message' => 'Olá, Mundo!']);
    }
}
