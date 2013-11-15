#import "SpecHelper.h"

#import "KPAViewControllerTestHelper.h"

SpecBegin(KPAViewControllerTestHelper)

__block UIViewController *_viewController;

describe(@"KPAViewControllerTestHelper", ^{
    before(^{
        _viewController = [[UIViewController alloc] init];
        _viewController.view = [[UIView alloc] init];
    });

    describe(@"presenting a view controller", ^{
        it(@"makes a new key window", ^{
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            [KPAViewControllerTestHelper presentViewController:_viewController];
            expect(keyWindow).toNot.equal([UIApplication sharedApplication].keyWindow);
        });

        it(@"sets the viewcontroller as the rootViewController", ^{
            [KPAViewControllerTestHelper presentViewController:_viewController];
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            expect(keyWindow.rootViewController).to.equal(_viewController);
        });
    });

    describe(@"pushing a view controller", ^{
        it(@"makes a new key window", ^{
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            [KPAViewControllerTestHelper pushViewController:_viewController];
            expect(keyWindow).toNot.equal([UIApplication sharedApplication].keyWindow);
        });

        it(@"sets a UINavigationController as the rootViewController", ^{
            [KPAViewControllerTestHelper pushViewController:_viewController];
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            expect(keyWindow.rootViewController).to.beKindOf([UINavigationController class]);
        });

        it(@"sets the viewController as the navigation controller's root", ^{
            [KPAViewControllerTestHelper pushViewController:_viewController];
            UINavigationController *navigationController = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            expect(navigationController.topViewController).to.equal(_viewController);
        });
    });
});

SpecEnd
