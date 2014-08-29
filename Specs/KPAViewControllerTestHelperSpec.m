#import "SpecHelper.h"

#import "KPAViewControllerTestHelper.h"

#import "ViewController.h"

SpecBegin(KPAViewControllerTestHelper)

__block ViewController *_viewController;

describe(@"KPAViewControllerTestHelper", ^{
    before(^{
        _viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
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

        it(@"the window's root view controller is the presenter", ^{
            [KPAViewControllerTestHelper presentViewController:_viewController];
            expect(_viewController.presentingViewController).to.equal([UIApplication sharedApplication].keyWindow.rootViewController);
        });

        it(@"it continues after a crash", ^{
            // The old pre-xode6 way of doing things would fail everything after a exception happened during the
            // presentation of a view controller. This doesn't really do anything, except make sure that the suite continues
            // succesfully after the exception.
            _viewController.shouldCrash = YES;
            expect(^{
                [KPAViewControllerTestHelper presentViewController:_viewController];
            }).to.raise(NSInternalInconsistencyException);
        });

        it(@"waits until the view controller has actually appeared", ^{
            [KPAViewControllerTestHelper presentViewController:_viewController];
            expect(_viewController.presentingViewController).to.equal([UIApplication sharedApplication].keyWindow.rootViewController);
        });

        it(@"gives access to outlets directly after the view controller is pushed", ^{
            [KPAViewControllerTestHelper pushViewController:_viewController];
            expect(_viewController.button).toNot.beNil();
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

        it(@"gives access to outlets directly after the view controller is pushed", ^{
            [KPAViewControllerTestHelper pushViewController:_viewController];
            expect(_viewController.button).toNot.beNil();
        });

        it(@"waits until the view controller has actually appeared", ^{
            [KPAViewControllerTestHelper presentViewController:_viewController];
            expect(_viewController.presentingViewController).to.equal([UIApplication sharedApplication].keyWindow.rootViewController);
        });
    });

    describe(@"presenting and dismissing", ^{
        it(@"waits until the view controller has actually disappeared", ^{
            [KPAViewControllerTestHelper presentAndDismissViewController:_viewController];
            expect(_viewController.presentingViewController).to.beNil();
        });
    });

    describe(@"presenting many view controllers in rapid succession", ^{
        it(@"waits until each presented view controller has appeared", ^{
            for (NSUInteger i = 0; i < 100; i++) {
                ViewController *viewController = [[UIStoryboard storyboardWithName:@"Main"
                                                                              bundle:nil] instantiateInitialViewController];
                [KPAViewControllerTestHelper presentViewController:viewController];
                expect(viewController.presentingViewController).to.equal([UIApplication sharedApplication].keyWindow.rootViewController);
            }
        });

        it(@"waits until each pushed view controller has appeared", ^{
            for (NSUInteger i = 0; i < 10; i++) {
                ViewController *viewController = [[UIStoryboard storyboardWithName:@"Main"
                                                                            bundle:nil] instantiateInitialViewController];
                [KPAViewControllerTestHelper pushViewController:viewController];
                expect(viewController.parentViewController).to.equal([UIApplication sharedApplication].keyWindow.rootViewController);
            }
        });
    });
});

SpecEnd
