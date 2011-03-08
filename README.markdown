# UIDickBar, An Awful Idea. #

[#Dickbar][1], new feature from Twitter for iPhone, now available for your iOS app too. 

![](https://github.com/digdog/UIDickBar/raw/master/Screenshots/Landscape.png)

## Update ##

I try to analysis the problems underlying the UIDickBar, and conclude in here: [**Problems and the Solution for UIDickBar**](http://digdog.tumblr.com/post/3729884380/problems-and-the-solution-for-uidickbar), read it if you're interested.

## Requirement ##

1. iOS 4.0 or later (Sample project was created from Xcode 4 GM 2)
2. Use LLVM Clang 2.0 compiler

## Usage ##

You simply init <code>UIDickBar</code> with title, badge and an action block:

    UIDickBar *dickBar = [[UIDickBar alloc] initWithDickTitle:@"#DickBar" dickBadge:@"Stupid" actionBlock:^{
        // Anything you want to do after UIDickBar tapped
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://digdog.tumblr.com"]];
    }];
    [dickBar showInView:self.view];
    [dickBar release];
    
Then you call <code>-showInView:</code> to display <code>UIDickBar</code> that originates from the specified view.

## Features ##

1. Look like real [#dickbar][1].
2. No fancy animations.
3. Support rotation.
4. Support Blocks.
5. Use UIDickBar to get tons of one star reviews, priceless.

## Screenshots ##

![](https://github.com/digdog/UIDickBar/raw/master/Screenshots/Landscape.png)  

![](https://github.com/digdog/UIDickBar/raw/master/Screenshots/Portrait.png)

## Credit ##

This project is created by [Ching-Lan 'digdog' Huang][2]. Alone with helps from following people:  

* [Daniel Tull][3]

Thanks!

## License ##

UIDickBar is released under MIT License.
    
[1]: http://twitter.com/#search?q=%23dickbar
[2]: http://digdog.tumblr.com
[3]: http://danieltull.co.uk/