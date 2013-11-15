# Introduction

A convenience class for testing iOS view controllers

# Installation

Add the following to your [Podfile](http://docs.cocoapods.org/podfile.html):

    pod "KPAStoryboardConvenience"

# Usage

Before a test present the view controller like so:

    [KPAViewControllerTestHelper presentViewController:_viewController];

Or if the view controller is part of a navigation stack use:

    [KPAViewControllerTestHelper pushViewController:_viewController];
