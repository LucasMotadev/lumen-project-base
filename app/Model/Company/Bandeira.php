<?php

/*
|--------------------------------------------------------------------------
| Gerado altomaticamente  by Lucas Mota
|--------------------------------------------------------------------------
|
*/

namespace App\Model\Company;

use App\Model\BaseModel;

class Bandeira extends BaseModel
{

    protected $table = "bandeira";

    protected $fillable = ['id','descricao'];

    protected $primaryKey = "id";

    public $timestamps = false;


    

        
    public function empresas()
    {
        return $this->belongsTo(Empresas::class, 'bandeira_id', 'id');
    }
}

