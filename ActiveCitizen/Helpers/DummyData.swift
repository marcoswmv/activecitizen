//
//  DummyData.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 31.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

struct DummyData {
    static var votes: [[String: Any]] = [ [ "id": 1234, "message": "Оценка проектов благоустройства Великого Новгорода", "date": "2020-01-2T3:14:32.862+0000"],
                                          [ "id": 5678, "message": "Some random text just to test this data", "date": "2020-04-7T8:18:32.862+0000"],
                                          [ "id": 9101, "message": "Другой текст для тестирования", "date": "2020-07-9T1:+55:32.862+0000"]]
    static var users: [[String: Any]] = [[ "id": 3301, "fio": "Евгений Павлов", "active": 10, "completed": 7, "rejected": 1],
                                         [ "id": 3302, "fio": "Ирина Иванова", "active": 3, "completed": 0, "rejected": 0],
                                         [ "id": 5251, "fio": "Имя006 Фамилия006", "active": 2, "completed": 1, "rejected": 0],
                                         [ "id": 4, "fio": "User User", "active": 0, "completed": 0, "rejected": 0],
                                         [ "id": 1951, "fio": "Иванов Иван", "active": 4, "completed": 5, "rejected": 0000],
                                         [ "id": 1952, "fio": "Петр Петров", "active": 358, "completed": 66, "rejected": 41],
                                         [ "id": 2051, "fio": "Федорова Алина", "active": 3548, "completed": 676, "rejected": 741],
                                         [ "id": 2052, "fio": "Лидия Васильева", "active": 3548, "completed": 676, "rejected": 741],
                                         [ "id": 3303, "fio": "Александр Петров", "active": 8, "completed": 76, "rejected": 74],
                                         [ "id": 5401, "fio": "Денис Кузин", "active": 0, "completed": 23, "rejected": 1],
                                         [ "id": 7201, "fio": "Имя Фамилия", "active": 0, "completed": 0, "rejected": 0]]
    static var comments: [[String: Any]] = [[ "id": 2258,
                                              "taskDefinitionKey": "TaskModeration",
                                              "message": "Комментарий через REST API",
                                              "organizationId": 1232,
                                              "authority": "Заявитель",
                                              "files": ["dog6"],
                                              "firstName": "Евгений",
                                              "lastName": "Павлов",
                                              "creationTime": "2020-01-27T18:15:32.862+0000"],
                                            [ "id": 2233,
                                              "taskDefinitionKey": "TaskModeration",
                                              "message": "Обращение создано и передано на модерацию",
                                              "organizationId": 8765,
                                              "authority": "Заявитель",
                                              "files": ["dog4, dog5"],
                                              "firstName": "Евгений",
                                              "lastName": "Павлов",
                                              "creationTime": "2020-01-27T14:51:19.765+0000"],
                                            [ "id": 2043,
                                              "taskDefinitionKey": "TaskPerformanceEvaluation",
                                              "message": "Обращение завершено",
                                              "files": ["dog7"],
                                              "organizationId": 1672,
                                              "authority": "Модератор",
                                              "firstName": "Алексей",
                                              "lastName": "Кантов",
                                              "creationTime": "2020-01-30T1:56:19.765+0000"]]
    static var subCategories: [[String: Any]] = [   [ "id": 1204, "parentId": 1101, "name": "Аварийные опоры линий наружного освещения"],
                                                    [ "id": 1205, "parentId": 1101, "name": "Автомобильные дороги"],
                                                    [ "id": 1206, "parentId": 1101, "name": "Водоснабжение в многоквартирном доме"],
                                                    [ "id": 1207, "parentId": 1101, "name": "Газ и топливо"],
                                                    [ "id": 1208, "parentId": 1101, "name": "Многоквартирные дома"],
                                                    [ "id": 1209, "parentId": 1101, "name": "Общественный транспорт"],
                                                    [ "id": 1210, "parentId": 1102, "name": "Плата за ЖКУ и работа ЕИРЦ"],
                                                    [ "id": 1212, "parentId": 1102, "name": "Некорректная разметка проезжей части, отсутствие разметки"],
                                                    [ "id": 1213, "parentId": 1102, "name": "Необходима установка и замена дорожных ограждений"],
                                                    [ "id": 1214, "parentId": 1102, "name": "Неработающие линии наружного освещения"],
                                                    [ "id": 1215, "parentId": 1103, "name": "Неработающие светильники"],
                                                    [ "id": 1216, "parentId": 1103, "name": "Несанкционированное ограничение движения, помехи движению, захват земли в полосе отвода автодорог"],
                                                    [ "id": 1217, "parentId": 1103, "name": "Несанкционированные свалки, мусор на дорогах"],
                                                    [ "id": 1218, "parentId": 1103, "name": "Несоблюдение правил уборки проезжей части"],
                                                    [ "id": 1219, "parentId": 1103, "name": "Обращения о необходимости вывезти снег после уборки"],
                                                    [ "id": 1220, "parentId": 1103, "name": "Обращения о необходимости очистить автобусную остановку от снега и наледи"],
                                                    [ "id": 1221, "parentId": 1103, "name": "Обращения о необходимости очистить дороги от снега и наледи"],
                                                    [ "id": 1222, "parentId": 1103, "name": "Обращения о необходимости очистить тротуар от снега и наледи"],
                                                    [ "id": 1223, "parentId": 1103, "name": "Обустройство велодорожек"],
                                                    [ "id": 1224, "parentId": 1103, "name": "Обустройство пешеходного перехода"],
                                                    [ "id": 1225, "parentId": 1104, "name": "Организация специализированных мест для инвалидов на существующих парковках"],
                                                    [ "id": 1226, "parentId": 1104, "name": "Отсутствие люка, решетки канализации"],
                                                    [ "id": 1227, "parentId": 1104, "name": "Подтопление автомобильных дорог"],
                                                    [ "id": 1228, "parentId": 1104, "name": "Предложения по установке новых линий освещения"],
                                                    [ "id": 1229, "parentId": 1104, "name": "Предложить (возразить) парковку на улично-дорожной сети"],
                                                    [ "id": 1230, "parentId": 1104, "name": "Предложить дорогу в план ремонта"],
                                                    [ "id": 1231, "parentId": 1105, "name": "Предложить тротуар в план строительства, обустройства"],
                                                    [ "id": 1232, "parentId": 1105, "name": "Предложить установку нового лежачего полицейского (ИДН)"],
                                                    [ "id": 1233, "parentId": 1105, "name": "Работа светофора (установка, изменение режима работы, оборудование кнопкой вызова)"],
                                                    [ "id": 1234, "parentId": 1105, "name": "Ремонт и замена частей лежачих полицейских (ИДН)"],
                                                    [ "id": 1235, "parentId": 1105, "name": "Содержание дорожных знаков"],
                                                    [ "id": 1236, "parentId": 1106, "name": "Содержание дорожных ограждений, демонтаж аварийных дорожных ограждений"],
                                                    [ "id": 1237, "parentId": 1106, "name": "Содержание и ремонт тротуаров"],
                                                    [ "id": 1238, "parentId": 1106, "name": "Содержание парковочных мест"],
                                                    [ "id": 1239, "parentId": 1106, "name": "Создание безбарьерной среды для инвалидов и маломобильных групп населения на объектах дорожной инфраструктуры"],
                                                    [ "id": 1240, "parentId": 1107, "name": "Сообщить о бесхозяйной дороге"],
                                                    [ "id": 1241, "parentId": 1107, "name": "Строительство или реконструкция дорог"],
                                                    [ "id": 1242, "parentId": 1107, "name": "Уборка, чистка светильников, опор наружного освещения"],
                                                    [ "id": 1243, "parentId": 1107, "name": "Укрепление обочин"],
                                                    [ "id": 1244, "parentId": 1108, "name": "Установка дополнительных технических средств безопасности дорожного движения"],
                                                    [ "id": 1245, "parentId": 1108, "name": "Установка новых дорожных знаков, с внесением в схему дислокации, замена старых знаков на новые"],
                                                    [ "id": 1246, "parentId": 1108, "name": "Ямы и выбоины на дороге"]]
    static var categories: [[String: Any]] = [[ "id": 1101, "name": "Благоустройство дворовой территории"],
                                              [ "id": 1102, "name": "Автомобильные дороги"],
                                              [ "id": 1103, "name": "Водоснабжение в многоквартирном доме"],
                                              [ "id": 1104, "name": "Газ и топливо"],
                                              [ "id": 1105, "name": "Многоквартирные дома"],
                                              [ "id": 1106, "name": "Общественный транспорт"],
                                              [ "id": 1107, "name": "Плата за ЖКУ и работа ЕИРЦ"],
                                              [ "id": 1108, "name": "Народный инспектор"]]
    static var reports: [[String: Any]] = [[ "id": 123, "userId": 3301, "categoryId": 1101, "created": "2013-12-02T19:13:16.167+0000", "categoryName":  "Автомобильные дороги",
                                             "subcategoryName": "Аварийные опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog1"], "taskDefinitionKey": "TaskEnterResult"],
                                           [ "id": 456, "userId": 3301, "categoryId": 1102, "created": "2020-1-02T19:13:16.167+0000", "categoryName": "Автомобильные орфвлытоылчы",
                                             "subcategoryName": "Аварийные опоры линиаватртноьй наружного оносвещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": [], "taskDefinitionKey": "TaskAcceptance"],
                                           [ "id": 789, "userId": 3301, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, Ломоносова улица, 5",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2", "dog3"], "taskDefinitionKey": "TaskRejected"],
                                           [ "id": 789, "userId": 3301, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Морозовская улица, 4",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog4", "dog5"], "taskDefinitionKey": "TaskModeration"],
                                           [ "id": 789, "userId": 3301, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Охотника улица, 8",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog6", "dog7"], "taskDefinitionKey": "TaskClosed"],
                                           [ "id": 789, "userId": 3301, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Проспект Мира, 9/3",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog8", "dog1"], "taskDefinitionKey": "TaskEnterResult"],
                                           [ "id": 123, "userId": 3302, "categoryId": 1101, "created": "2013-12-02T19:13:16.167+0000", "categoryName":  "Автомобильные дороги",
                                             "subcategoryName": "Аварийные опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2"], "taskDefinitionKey": "TaskEnterResult"],
                                           [ "id": 456, "userId": 3302, "categoryId": 1102, "created": "2020-1-02T19:13:16.167+0000", "categoryName": "Автомобильные орфвлытоылчы",
                                             "subcategoryName": "Аварийные опоры линиаватртноьй наружного оносвещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": [], "taskDefinitionKey": "TaskAcceptance"],
                                           [ "id": 789, "userId": 3302, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, Ломоносова улица, 5",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog4", "dog3"], "taskDefinitionKey": "TaskRejected"],
                                           [ "id": 789, "userId": 3302, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Морозовская улица, 4",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog5", "dog6"], "taskDefinitionKey": "TaskModeration"],
                                           [ "id": 789, "userId": 3302, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Охотника улица, 8",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog7", "dog8"], "taskDefinitionKey": "TaskClosed"],
                                           [ "id": 789, "userId": 3302, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Проспект Мира, 9/3",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog1", "dog2"], "taskDefinitionKey": "TaskEnterResult"],
                                           [ "id": 123, "userId": 5251, "categoryId": 1101, "created": "2013-12-02T19:13:16.167+0000", "categoryName":  "Автомобильные дороги",
                                             "subcategoryName": "Аварийные опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog3"], "taskDefinitionKey": "TaskEnterResult"],
                                           [ "id": 456, "userId": 5251, "categoryId": 1102, "created": "2020-1-02T19:13:16.167+0000", "categoryName": "Автомобильные орфвлытоылчы",
                                             "subcategoryName": "Аварийные опоры линиаватртноьй наружного оносвещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": [], "taskDefinitionKey": "TaskAcceptance"],
                                           [ "id": 789, "userId": 5251, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, Ломоносова улица, 5",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog4", "dog5"], "taskDefinitionKey": "TaskRejected"],
                                           [ "id": 789, "userId": 5251, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Морозовская улица, 4",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2", "dog3"], "taskDefinitionKey": "TaskModeration"],
                                           [ "id": 789, "userId": 5251, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Охотника улица, 8",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2", "dog3"], "taskDefinitionKey": "TaskClosed"],
                                           [ "id": 789, "userId": 1952, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Проспект Мира, 9/3",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2", "dog3"], "taskDefinitionKey": "TaskEnterResult"],
                                           [ "id": 123, "userId": 1952, "categoryId": 1101, "created": "2013-12-02T19:13:16.167+0000", "categoryName":  "Автомобильные дороги",
                                             "subcategoryName": "Аварийные опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog1"], "taskDefinitionKey": "TaskEnterResult"],
                                           [ "id": 456, "userId": 1952, "categoryId": 1102, "created": "2020-1-02T19:13:16.167+0000", "categoryName": "Автомобильные орфвлытоылчы",
                                             "subcategoryName": "Аварийные опоры линиаватртноьй наружного оносвещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": [], "taskDefinitionKey": "TaskAcceptance"],
                                           [ "id": 789, "userId": 1952, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, Ломоносова улица, 5",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2", "dog3"], "taskDefinitionKey": "TaskRejected"],
                                           [ "id": 789, "userId": 1952, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Морозовская улица, 4",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2", "dog3"], "taskDefinitionKey": "TaskModeration"],
                                           [ "id": 789, "userId": 2051, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Охотника улица, 8",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2", "dog3"], "taskDefinitionKey": "TaskClosed"],
                                           [ "id": 789, "userId": 2052, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                             "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Проспект Мира, 9/3",
                                             "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2", "dog3"], "taskDefinitionKey": "TaskEnterResult"]]
}