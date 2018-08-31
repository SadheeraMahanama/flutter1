// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/semantics.dart';

import '../flutter_test_alternative.dart';

void main() {
  group(CustomSemanticsAction, () {

    test('is provided a canonical id based on the label', () {
      final CustomSemanticsAction action1 = new CustomSemanticsAction(label: _nonconst('test'));
      final CustomSemanticsAction action2 = new CustomSemanticsAction(label: _nonconst('test'));
      final CustomSemanticsAction action3 = new CustomSemanticsAction(label: _nonconst('not test'));
      final int id1 = CustomSemanticsAction.getIdentifier(action1);
      final int id2 = CustomSemanticsAction.getIdentifier(action2);
      final int id3 = CustomSemanticsAction.getIdentifier(action3);

      expect(id1, id2);
      expect(id2, isNot(id3));
      expect(CustomSemanticsAction.getAction(id1), action1);
      expect(CustomSemanticsAction.getAction(id2), action1);
      expect(CustomSemanticsAction.getAction(id3), action3);
    });

  });
}

T _nonconst<T>(T value) => value;