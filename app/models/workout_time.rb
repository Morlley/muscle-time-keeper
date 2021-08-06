class WorkoutTime < ActiveHash::Base
  self.data = [
    { id: 1, name: "--", second: 0 },
    { id: 2, name: "10秒", second: 10 },
    { id: 3, name: "15秒", second: 15 },
    { id: 4, name: "20秒", second: 20 },
    { id: 5, name: "30秒", second: 30 },
    { id: 6, name: "45秒", second: 45 },
    { id: 7, name: "1分", second: 60 },
    { id: 8, name: "1分30秒", second: 90 },
    { id: 9, name: "2分", second: 120 },
    { id: 10, name: "2分30秒", second: 150 },
    { id: 11, name: "3分", second: 180 }
  ]

  include ActiveHash::Associations
  has_many :routines
  has_many :next_routines
  
end