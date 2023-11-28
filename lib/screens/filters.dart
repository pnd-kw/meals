import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/widgets/filters_switch.dart';
import 'package:meals/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilters,
  });

//   // final Map<Filter, bool> currentFilters;

//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  // var _glutenFreeFilterSet = false;
  // var _lactoseFreeFilterSet = false;
  // var _vegetarianFilterSet = false;
  // var _veganFilterSet = false;

  // @override
  // void initState() {
  //   final activeFilters = ref.read(filtersProvider);
  //   _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
  //   _veganFilterSet = activeFilters[Filter.vegan]!;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // body: WillPopScope(
      //   onWillPop: () async {
      //     ref.read(filtersProvider.notifier).setFilters({
      //       Filter.glutenFree: _glutenFreeFilterSet,
      //       Filter.lactoseFree: _lactoseFreeFilterSet,
      //       Filter.vegetarian: _vegetarianFilterSet,
      //       Filter.vegan: _veganFilterSet,
      //     });
      //     // Navigator.of(context).pop({});
      //     return true;
      //   },
      //   child: Column(
      body: Column(
        children: [
          // SwitchListTile(
          //   value: _glutenFreeFilterSet,
          //   onChanged: (isChecked) {
          //     setState(() {
          //       _glutenFreeFilterSet = isChecked;
          //     });
          //   },
          //   title: Text(
          //     'Gluten-free',
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   subtitle: Text(
          //     'Only include gluten-free meals.',
          //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   activeColor: Theme.of(context).colorScheme.tertiary,
          //   contentPadding: const EdgeInsets.only(
          //     left: 34,
          //     right: 22,
          //   ),
          // ),
          FiltersSwitch(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
              // setState(() {
              //   _glutenFreeFilterSet = isChecked;
              // });
            },
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
          ),
          FiltersSwitch(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
              // setState(() {
              //   _lactoseFreeFilterSet = isChecked;
              // });
            },
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
          ),
          FiltersSwitch(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
              // setState(() {
              //   _vegetarianFilterSet = isChecked;
              // });
            },
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
          FiltersSwitch(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
              // setState(() {
              //   _veganFilterSet = isChecked;
              // });
            },
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}
