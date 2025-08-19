import 'package:artora/routes/app_route.dart';
import 'package:artora/shared/widget/glassmorphism.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/image/welcome.png" , fit: BoxFit.cover),
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.05,
            child: Text(
              "Welcome to\nNFT Marketplace",
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 32
              ),
            ),
          ),
          Positioned(
            bottom: 64,
            right: 16,
            left: 16,
            child: GlassMorphism(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Explore and Mint NFTs",
                      style: theme.textTheme.titleLarge,
                    ),
                    Gap(8),
                    Text(
                      "You can buy and sell the NFTs of the best artists in the world.",
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: Colors.grey
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(16),
                    GlassMorphism(
                      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                      borderColor: Colors.white,
                      borderRadius: 64,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).popAndPushNamed(AppRoute.home);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 32 , vertical: 12),
                          child: Text(
                            "Get started now",
                            style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                    ),
                    Gap(8)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}