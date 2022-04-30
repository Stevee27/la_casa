import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/Order.dart';
import '../models/OrderItem.dart';

class OrderRepository {
  Future<List<Order>> getOrdersForUser() async {
    try {
      List<Order> orders = await Amplify.DataStore.query(Order.classType);
      return orders;
    } catch (e) {
      throw e as Exception;
    }
  }

  Future<void> createOrder(Order order) async {
    try {
      await Amplify.DataStore.save(order);
    } catch (e) {
      throw e as Exception;
    }
  }

  Future<void> createOrderItem(OrderItem orderItem) async {
    try {
      await Amplify.DataStore.save(orderItem);
    } catch (e) {
      throw e as Exception;
    }
  }

  Future<void> updateOrder(Order order) async {
    try {
      await Amplify.DataStore.save(order);
    } catch (e) {
      throw e as Exception;
    }
  }

  Future<void> addOrderItem(Order order, OrderItem orderItem) async {
    try {
      List<OrderItem> orderItems;
      if (order.OrderItems != null) {
        orderItems = order.OrderItems!;
      } else {
        orderItems = <OrderItem>[];
      }
      orderItems.add(orderItem);
      await Amplify.DataStore.save(order.copyWith(OrderItems: orderItems));
    } catch (e) {
      throw e as Exception;
    }
  }
}
