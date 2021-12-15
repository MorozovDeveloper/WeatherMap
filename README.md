# Описание pet-проекта:

Отображение данных погоды по городам, поиск которых осуществляется с помощью SearchBar из выезжающего снизу ViewController.

```
Применение:
MVC
MapKit
CoreLocation
RestAPI
KeyboardNotification
UIViewPropertyAnimator
UISearchBar
xib 
______________________________________

Баги(в процессе исправления):
- При закрытии FloatingVC тапом по экрану, после, нужно дважды тапать по handleArea чтобы открыть.
Возможное решение: сделать проверку на текущее положение FloatingVC.
- При вводе в поиск города с двойным названием, например Los Angeles, приложение падает.
Возможное решение: применить split(separator).
- После нахождения информации о погоде и приближении к городу карты, FloatingVC немного перекрывает метку и часть города. 
Возможное решение: Изменить координаты поиска.
```

<img src="https://user-images.githubusercontent.com/76910221/143735090-17984421-886b-4291-b3c2-1483e9c2d692.png" width="200" height="400" />
<img src="https://user-images.githubusercontent.com/76910221/143735419-9fe47717-94ba-4827-844d-dd343daa0b7b.png" width="200" height="400" />
<img src="https://user-images.githubusercontent.com/76910221/143735422-6c4fce19-fa40-4c0b-95aa-d4fd5b558783.png" width="200" height="400" />
<img src="https://user-images.githubusercontent.com/76910221/143766472-2fff6fa9-84e3-4de2-8fc6-275853b40485.png" width="200" height="400" />
