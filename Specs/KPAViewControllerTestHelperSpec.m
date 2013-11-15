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
});

SpecEnd
