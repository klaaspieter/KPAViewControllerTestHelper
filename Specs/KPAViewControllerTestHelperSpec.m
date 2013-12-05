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

        it(@"assigns an empty view controller as the root view controller of the window", ^{
            [KPAViewControllerTestHelper presentViewController:_viewController];
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            expect(keyWindow.rootViewController).toNot.equal(_viewController);
        });

        it(@"presents the view controller on the window's rootViewController", ^{
            [KPAViewControllerTestHelper presentViewController:_viewController];
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            expect(keyWindow.rootViewController.presentedViewController).to.equal(_viewController);
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

        it(@"sets an empty view controller as the navigation controller's root", ^{
            [KPAViewControllerTestHelper pushViewController:_viewController];
            UINavigationController *navigationController = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            expect(navigationController.viewControllers[0]).toNot.equal(_viewController);
        });

        it(@"pushes the view controller on top of the navigation's controller rootViewController", ^{
            [KPAViewControllerTestHelper pushViewController:_viewController];
            UINavigationController *navigationController = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            expect(navigationController.topViewController).to.equal(_viewController);
        });
    });
});

SpecEnd
