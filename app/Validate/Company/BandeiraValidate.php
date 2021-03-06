<?php

namespace App\Validate\Company;

use App\Validate\BaseValidate;
use App\Validate\IValidate;

trait BandeiraValidate 
{

    public function getCreateRules(): array
    {
        return [
            'id' => 'unique:bandeira,id', 
            'descricao' => 'string|max:45|'
        ];
    }

    public function getUpdateRules($id): array
    {
        return [
            'id' => 'unique:bandeira,id',
            'descricao' => 'string|max:45|'
        ];
    }

    public function getDestroyRules(): array
    {
        return [];
    }
}
