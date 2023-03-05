import 'package:eduba_test_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.onChange,
    required this.controller,
    this.onTap,
    this.node,
  });
  final Function onChange;
  final VoidCallback? onTap;

  final TextEditingController controller;
  final FocusNode? node;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.node != null) {
      FocusScope.of(context).requestFocus(widget.node);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.node,
      onTap: widget.onTap ?? () {},
      controller: widget.controller,
      style: TextStyle(color: white, fontSize: 14.sp),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      cursorColor: white,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: red),
        prefixIcon: const Padding(
          // padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0),
          padding: EdgeInsets.zero,

          child: Icon(Icons.search),
        ),
        contentPadding: EdgeInsets.zero,
        suffixIcon: widget.controller.text.trim().isEmpty
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: () {
                  widget.controller.clear();
                  setState(() {});
                },
                icon: const Icon(Icons.close, color: red),
              ),
        // border: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        fillColor: Colors.grey.withOpacity(.3),
        filled: true,
        enabled: true,
        prefixIconColor: red,
        isDense: false,
      ),
      onChanged: (String value) {
        widget.onChange(value);
      },
    );
  }
}
