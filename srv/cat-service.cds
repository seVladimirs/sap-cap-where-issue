using my.bookshop as my from '../db/data-model';

/**
 * Not working - return nothing, when I do a request as bob
 */
@requires : 'authenticated-user'
service CatalogService {
    @readonly
    entity Books as projection on my.Books where user = $user;
}

/**
 * Works, but not what I need Return alice when I do a request
 * as bob
 */
@requires : 'authenticated-user'
service CatalogWorkingHardcodedService {
    @readonly
    entity Books as projection on my.Books where user = 'alice';
}

/**
 * Works - Return bob's data when I do a request as bob
 */
@requires : 'authenticated-user'
service CatalogWorkingWithRestrictService {
    @readonly
    entity Books @(restrict : [{where : 'user = $user'}]) as projection on my.Books;
}


@requires : 'authenticated-user'
service TaskService {
    @readonly
    entity Tasks @(restrict : [{where : 'user.user = $user'}]) as projection on my.Tasks;
}
