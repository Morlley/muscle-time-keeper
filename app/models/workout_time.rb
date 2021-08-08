class WorkoutTime < ActiveHash::Base
  self.data = [
    { id: 1, name: "--", seconds: 0 },
    { id: 2, name: "10秒", seconds: 10 },
    { id: 3, name: "15秒", seconds: 15 },
    { id: 4, name: "20秒", seconds: 20 },
    { id: 5, name: "30秒", seconds: 30 },
    { id: 6, name: "45秒", seconds: 45 },
    { id: 7, name: "1分", seconds: 60 },
    { id: 8, name: "1分30秒", seconds: 90 },
    { id: 9, name: "2分", seconds: 120 },
    { id: 10, name: "2分30秒", seconds: 150 },
    { id: 11, name: "3分", seconds: 180 }
  ]

  include ActiveHash::Associations
  has_many :routines
  has_many :next_routines
  
end