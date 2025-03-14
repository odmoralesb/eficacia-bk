# Consideraciones para aprobar la liberación de cambios.
+ **Este sistema tiene despliegue por Pipeline de CI/CD.**
+ _Si requiere configuración sobre servicios Azure, infraestructura (App Services, Library, permisos, etc), por favor gestionar la actividad de forma manual._
----
+ _Recuerde validar que no existan objetos o código que haga referencia a la palabra **ModuloBase**, en caso tal se debe realizar la respectiva refactorización. (Aplica para los repositorios nuevos creados en base a las plantillas **ERP_TQ-ModuloBase-Frontend y/o ERP_TQ-ModuloBase-Backend)**_
----
- [ ] **¿Requiere bajar el sistema o ventana de liberación?.** 
- [ ] **¿Requiere gestionar tareas de BD o Sistema operativo para la liberación?**
		(Se debe relacionar las acciones a ejecutar en la rutina de liberación xlsx)
- [ ] ¿Requiere configuración adicional de infraestructura?
		(Permisos, variables de entorno, etc).
		 (Si existe manual o instructivo para la configuración adicional, favor adjuntar el documento en la tarea de liberación a producción de la HU/BUG).
- [ ] ¿El Pull Request tiene relacionada la tarea de liberación a Producción de la HU/BUG?		
- [ ] ¿La rutina de liberación esta adjunta en la tarea de liberación a Producción de la HU/BUG?
