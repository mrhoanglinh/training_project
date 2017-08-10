module BlogHelper
  def custom_errors(blog)
    @title_error = ''
    @category_error = ''
    @datePublic_error = ''
    @image_error = ''
    @content_error = ''
    @author_error = ''
    @jobName_error = ''
    @age_error = ''
    @authorImage_error = ''
    if blog.errors.any?
      blog.errors.messages.each_with_index do |msg,idx|
        if msg[0].eql?(:title)
          @title_error = msg[1].last
        end
        if msg[0].eql?(:category)
          @category_error = msg[1].last
        end
        if msg[0].eql?(:datePublic)
          @datePublic_error = msg[1].last
        end
        if msg[0].eql?(:image)
          @image_error = msg[1].last
        end
        if msg[0].eql?(:content)
          @content_error = msg[1].last
        end
        if msg[0].eql?(:author)
          @author_error = msg[1].last
        end
        if msg[0].eql?(:jobName)
          @jobName_error = msg[1].last
        end
        if msg[0].eql?(:age)
          @age_error = msg[1].last
        end
        if msg[0].eql?(:authorImage)
          @authorImage_error = msg[1].last
        end
      end
    end
  end

  def interest_count(count_action)
    if count_action['interest']
      count_action['interest']
    else
      0
    end
  end

  def like_count(count_action)
    if count_action['like']
      count_action['like']
    else
      0
    end
  end

  def dislike_count(count_action)
    if count_action['dislike']
      count_action['dislike']
    else
      0
    end
  end

  def disappoint_count(count_action)
    if count_action['disappoint']
      count_action['disappoint']
    else
      0
    end
  end

end