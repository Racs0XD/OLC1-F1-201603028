import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EjecutarComponent } from './vistas/ejecutar/ejecutar.component';
import { PrincipalComponent } from './vistas/principal/principal.component'
import { ReportesComponent } from './vistas/reportes/reportes.component';

const routes: Routes = [
  {path:'',redirectTo:'principal', pathMatch:'full'},
  {path:'principal',component:PrincipalComponent},
  {path:'reportes', component:ReportesComponent},
  {path:'ejecutar', component:EjecutarComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

export const routingComponent = [PrincipalComponent,ReportesComponent,EjecutarComponent]
