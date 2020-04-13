package Application;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

import Entity.Food;
import dao.FoodDAO;

public class Menu {
	
	private FoodDAO FoodDAO = new FoodDAO();
	private Scanner scanner = new Scanner(System.in);
	private List<String> options = Arrays.asList(
			"View Menu",
			"Add food to cart",
			"Remove food from cart",
			"Review Order");
	
	public void start() {
		String selection = "";
			
		do {
			printMenu();
			selection = scanner.nextLine();
			
			
				try {
					if (selection.equals("1")) {
						viewFoodOptions();
					} else if (selection.equals("2")) {
						//addFood();
					} else if (selection.equals("3")) {
						//removeFood();
					} else if (selection.equals("4")) {
						//reviewOrder();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			
			System.out.println("Press Enter to continue.");
			scanner.nextLine();

		} while (!selection.equals("-1"));
	}

	private void printMenu() {
		System.out.println("Select an option:\n____________________________________");
		for (int i = 0; i < options.size(); i++) {
			System.out.println(i + 1 + ") " + options.get(i)); 
		}
	}
	
	private void viewFoodOptions() throws SQLException {
		List<Food> food = FoodDAO.getFood();
		for (Food foods : food) {
			System.out.println(foods.getFoodName() + foods.getPrice());
		
		}
	}
	
	private void addFood() throws SQLException {
		System.out.println("Please make a selection.");
		int id = scanner.nextLine();
		FoodDAO.addFood(id, foodName, category, price);
	}
	
	private void removeFood() throws SQLException {
		System.out.println("Remove items.");
		int id = Integer.parseInt(scanner.nextLine());
		FoodDAO.removeFood(id);
	}
}
