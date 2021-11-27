using my.bookshop as my from '../db/data-model';

@requires : 'authenticated-user'
service CatalogService {
    @readonly
    entity Books as projection on my.Books where user = $user;
}


@requires : 'authenticated-user'
service CatalogWorkingHardcodedService {
    @readonly
    entity Books as projection on my.Books where user = 'alice';
}


@requires : 'authenticated-user'
service CatalogWorkingWithRestrictService {
    @readonly
    entity Books @(restrict : [{where : 'user = $user'}]) as projection on my.Books;
}
