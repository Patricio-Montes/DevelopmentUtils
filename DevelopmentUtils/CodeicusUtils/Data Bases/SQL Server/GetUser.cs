using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace DevelopmentUtils.Data_Bases.SQL_Server
{
    class Class1
    {
        /* select u.usuario,* 
          from Usuario u inner join Usuario_ToyotaDirect utd
          on u.id_usuario = utd.id_usuario
          inner join [fu].dbo.cliente3 fuc
          on utd.id_cliente = fuc.cliente
          where u.eliminado <> 'S' and fuc.tipo in ('70','71','72', '73', '75') 
          and fuc.cliente in (select fur.id_cliente_usuario_web from fu.dbo.uag_relaciones fur)*/
    }
}