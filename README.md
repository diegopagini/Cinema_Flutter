<!-- @format -->

# cine_app

![image](https://github.com/diegopagini/Cinema_Flutter/assets/62857778/ef5fb4b5-13bf-42cc-8e1f-6fd957a0c46a)
![image](https://github.com/diegopagini/Cinema_Flutter/assets/62857778/6c4fec2b-f6d1-4725-9f92-b028a4f41a08)
![image](https://github.com/diegopagini/Cinema_Flutter/assets/62857778/d2a38686-1bf2-4b4c-9047-5e43166f8358)


---

- Entidades son atómicas.
- Los repositorios llaman Datasources.
- Las implementaciones de los Datasources son quienes hacen el trabajo.
- El gesto de estado es el puente que ayuda a realizar los cambios en el UI.

# Dev

1. Copiar .env.template y renombrar a .env
2. Cambiar variables de entorno
3. Crear BD local (o cambios en la entidad)

```
flutter pub run build_runner build
```
