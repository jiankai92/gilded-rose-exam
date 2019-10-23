class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # Linking Item to desired update_quality method based on item.name
      case item.name
      when "Aged Brie"
        update_aged_item_quality(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        update_expirable_item_quality(item)
      when "Sulfuras, Hand of Ragnaros"
        # No Logic required as unlike conventional items, The legendary item does not degrade in terms of quality or sell_in
      when "Conjured"
        update_conjured_item_quality(item)
      else
        update_normal_item_quality(item)
      end
    end
  end

  # Method to update Aged Items
  def update_aged_item_quality(item)
    # If item quality less than 50
    if item.quality < 50
      # Increase item quality by 1
      item.quality = item.quality + 1
    end
  end

  # Method to update Expirable Items
  def update_expirable_item_quality(item)
    # For expirable items ,first manipulate the quality based on sell_in value
    if item.sell_in >= 11
      item.quality = item.quality + 1
    elsif item.sell_in < 11 && item.sell_in >= 6
      item.quality = item.quality + 2
    elsif item.sell_in < 6 && item.sell_in > 0
      item.quality = item.quality + 3
    else
      item.quality = 0
    end

    # Then scale down to quality to a max of 50 if required
    if item.quality > 50
      item.quality = 50
    end

    # Then Decrease sell_in by 1
    item.sell_in = item.sell_in - 1
  end

  # Method to update Conjured Items
  def update_conjured_item_quality(item)
    # First Decrease sell_in by 1
    item.sell_in = item.sell_in - 1
    # If sell_in less than 0
    if item.sell_in < 0
      # (and) If Quality More than or Equal to 2
      if item.quality >= 4
        # Decrease Item quality by 2
        item.quality = item.quality - 4
        # Else (Quality less than 2)
      else
        # Assign Quality to 0
        item.quality = 0
      end
      # Else (sell_in More than 0)
    else
      # (and) If Quality More than or Equal to 1
      if item.quality >= 2
        # Decrease Item quality by 1
        item.quality = item.quality - 2
      else
        # Assign Quality to 0
        item.quality = 0
      end
    end
  end

  # Method to update normal Items
  def update_normal_item_quality (item)
    # First Decrease sell_in by 1
    item.sell_in = item.sell_in - 1
    # If sell_in less than 0
    if item.sell_in < 0
      # (and) If Quality More than or Equal to 2
      if item.quality >= 2
        # Decrease Item quality by 2
        item.quality = item.quality - 2
        # Else (Quality less than 2)
      else
        # Assign Quality to 0
        item.quality = 0
      end
      # Else (sell_in More than 0)
    else
      # (and) If Quality More than or Equal to 1
      if item.quality >= 1
        # Decrease Item quality by 1
        item.quality = item.quality - 1
      else
        # Assign Quality to 0
        item.quality = 0
      end
    end
  end

end
