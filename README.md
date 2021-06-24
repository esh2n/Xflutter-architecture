# flutter個人的アーキテクチャ
> MVVM + RepositoryパターンとDDDを意識しています.

- common: log, errorhandler
- model: domain + model(data保持, ここ分けた方が良いかも)
- repository: data(simple CRUD)
- usecase: application service(-> repo)
- view: view(data I/O)
- viewmodel: viewmodel(notifier, 加工, -> appservice)