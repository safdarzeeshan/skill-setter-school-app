# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    return unless user.present?

    if user.respond_to?(:student) && user.student.present?
      student = user.student

      # Direct CourseTerm registration
      course_term_ids = Registration.where(
        student_id: student.id,
        registrationable_type: "CourseTerm"
      ).pluck(:registrationable_id)

      # Indirect via Term registration
      term_ids = Registration.where(
        student_id: student.id,
        registrationable_type: "Term"
      ).pluck(:registrationable_id)
      indirect_course_term_ids = CourseTerm.where(term_id: term_ids).pluck(:id)

      can :read, CourseTerm, id: (course_term_ids + indirect_course_term_ids).uniq
    end
  end
end
