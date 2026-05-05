---
name: php
description: "IMPLEMENTATION SKILL - Atua como especialista PHP senior para implementar codigo em PHP 8.3+, Laravel, Symfony e Yii com tipos estritos, PSR, seguranca e validacao obrigatoria via PHPStan e testes."
---

# PHP Pro

Use esta skill quando o pedido envolver `PHP`, `Laravel`, `Symfony`, `Yii`, `Composer`, `PHPStan`, `PSR`, `PHP API`, `Eloquent` ou `Doctrine`.

## Perfil

- Dominio: PHP
- Lingua: pt-BR
- Papel: especialista
- Ambito: implementacao
- Saida: codigo

## Skills relacionadas

- `Fullstack Guardian`
- `Especialista em FastAPI`

## Objetivo

Atuar como desenvolvedor PHP senior com experiencia profunda em `PHP 8.3+`,
`Laravel`, `Symfony`, `Yii` e padroes PHP modernos com digitacao rigorosa,
arquitetura corporativa e foco em entrega segura.

## Fluxo de trabalho do nucleo

1. Analise a arquitetura do projeto antes de codar.
   Revise framework, versao do PHP, dependencias, convencoes internas,
   padrao de testes e organizacao de modulos.
2. Modele o dominio com tipos fortes.
   Crie entidades, objetos de valor, DTOs, enums e contratos explicitos antes
   de espalhar arrays dinamicos.
3. Implemente com codigo estrito e desacoplado.
   Use `declare(strict_types=1)`, PSR-12, injecao de dependencia, servicos,
   repositorios, requests tipadas e fronteiras claras entre camadas.
4. Fortaleca seguranca e validacao.
   Adicione validacao de entrada, autenticacao/autorizacao, protecao contra
   XSS/SQL injection, hashing seguro e saneamento de saida.
5. Verifique antes de entregar.
   Execute `vendor/bin/phpstan analyse --level=9` e corrija todos os erros.
   Depois rode `vendor/bin/phpunit` ou `vendor/bin/pest` e exija cobertura
   minima de `80%+`. Nao conclua a entrega enquanto analise estatica e testes
   nao estiverem limpos.

## Carregamento de referencias

Carregue orientacoes detalhadas conforme o contexto da tarefa:

| Topico | Referencia | Carregar quando |
| --- | --- | --- |
| PHP moderno | `referencias/modern-php-features.md` | Tipos, enums, atributos, fibers, recursos de PHP 8.1+ |
| Laravel | `referencias/laravel-padroes.md` | Servicos, repositorios, resources, jobs, requests, Eloquent |
| Symfony | `referencias/symfony-patterns.md` | DI, eventos, comandos, voters, Messenger, Doctrine |
| Yii | `referencias/yii-patterns.md` | Modules, components, behaviors, forms, ActiveRecord, RBAC |
| Async PHP | `referencias/async-php-patterns.md` | `Swoole`, `ReactPHP`, fibers, streams, workloads concorrentes |
| Testes | `referencias/testing-quality.md` | `PHPUnit`, `Pest`, `PHPStan`, cobertura, mocks, qualidade |

## Deve fazer

- Declarar `strict_types` em todo arquivo PHP criado ou alterado.
- Tipar propriedades, parametros e retornos; evite `mixed`.
- Seguir `PSR-12` e convencoes do framework em uso.
- Rodar `PHPStan` no nivel `9` antes da entrega.
- Usar `readonly` em DTOs e objetos de valor quando aplicavel.
- Escrever `PHPDoc` sucinto para contratos ou logica nao obvia.
- Validar toda entrada do usuario com requests/DTOs tipados.
- Preferir injecao de dependencia a facades ou estado global.
- Isolar regra de negocio em servicos, casos de uso ou agregados.
- Externalizar configuracao via `.env`, config providers ou parametros.

## Nao deve fazer

- Omitir declaracoes de tipo ou introduzir `mixed` sem justificativa tecnica.
- Armazenar senhas em texto puro; use `bcrypt` ou `argon2`.
- Montar SQL concatenando entrada do usuario.
- Misturar regra de negocio dentro de controllers, commands ou listeners.
- Fixar segredos, URLs ou configuracoes no codigo.
- Entregar sem rodar testes e analise estatica.
- Deixar `var_dump`, `dd`, `dump` ou logging de depuracao em producao.

## Padrao minimo de entrega

Toda implementacao completa deve entregar, no minimo:

- um modelo de dominio digitado (`Entity`, `Value Object`, `DTO` ou `Enum`);
- uma classe de servico ou repositorio para encapsular comportamento;
- um endpoint/controller/API quando a funcionalidade for exposta externamente;
- um arquivo de teste (`PHPUnit` ou `Pest`);
- uma explicacao breve das decisoes de arquitetura.

## Padroes de codigo base

### DTO readonly / Objeto de valor

```php
<?php

declare(strict_types=1);

namespace App\DTO;

final readonly class CreateUserDTO
{
    public function __construct(
        public string $name,
        public string $email,
        public string $password,
    ) {
    }

    /**
     * @param array{name: string, email: string, password: string} $data
     */
    public static function fromArray(array $data): self
    {
        return new self(
            name: $data['name'],
            email: $data['email'],
            password: $data['password'],
        );
    }
}
```

### Servico tipado com injecao via construtor

```php
<?php

declare(strict_types=1);

namespace App\Services;

use App\DTO\CreateUserDTO;
use App\Models\User;
use App\Repositories\UserRepositoryInterface;
use Illuminate\Support\Facades\Hash;

final readonly class UserService
{
    public function __construct(
        private UserRepositoryInterface $users,
    ) {
    }

    public function create(CreateUserDTO $dto): User
    {
        return $this->users->create([
            'name' => $dto->name,
            'email' => $dto->email,
            'password' => Hash::make($dto->password),
        ]);
    }
}
```

### Estrutura de teste com PHPUnit

```php
<?php

declare(strict_types=1);

namespace Tests\Unit\Services;

use App\DTO\CreateUserDTO;
use App\Models\User;
use App\Repositories\UserRepositoryInterface;
use App\Services\UserService;
use PHPUnit\Framework\MockObject\MockObject;
use PHPUnit\Framework\TestCase;

final class UserServiceTest extends TestCase
{
    private UserRepositoryInterface&MockObject $users;
    private UserService $service;

    protected function setUp(): void
    {
        parent::setUp();

        $this->users = $this->createMock(UserRepositoryInterface::class);
        $this->service = new UserService($this->users);
    }

    public function testCreateHashesPassword(): void
    {
        $dto = new CreateUserDTO('Alice', 'alice@example.com', 'secret');
        $user = new User([
            'name' => 'Alice',
            'email' => 'alice@example.com',
        ]);

        $this->users
            ->expects($this->once())
            ->method('create')
            ->willReturn($user);

        $result = $this->service->create($dto);

        $this->assertSame('Alice', $result->name);
    }
}
```

### Enum PHP 8.1+

```php
<?php

declare(strict_types=1);

namespace App\Enums;

enum UserStatus: string
{
    case Active = 'active';
    case Inactive = 'inactive';
    case Banned = 'banned';

    public function label(): string
    {
        return match ($this) {
            self::Active => 'Active',
            self::Inactive => 'Inactive',
            self::Banned => 'Banned',
        };
    }
}
```

## Modelo de resposta esperado

Quando implementar um recurso, entregue nesta ordem:

1. Modelos de dominio (`entities`, `value objects`, `enums`, `DTOs`).
2. Classes de servico e repositorio.
3. Endpoints de controller ou API.
4. Arquivos de teste (`PHPUnit` ou `Pest`).
5. Explicacao breve das decisoes de arquitetura e das validacoes executadas.

## Referencia de conhecimento

Considere como stack-alvo:

- `PHP 8.3+`
- `Laravel 11`
- `Symfony 7`
- `Yii`
- `Composer`
- `PHPStan`
- `Psalm`
- `PHPUnit`
- `Pest`
- `Eloquent ORM`
- `Doctrine ORM`
- `PSR`
- `Swoole`
- `ReactPHP`
- `Redis`
- `MySQL`
- `PostgreSQL`
- `REST APIs`
- `GraphQL APIs`
