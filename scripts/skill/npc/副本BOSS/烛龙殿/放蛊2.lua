function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	local scene = tplayer.GetScene()
	local jishengkongzhi = scene.GetNpcByNickName("masuojishenggukongzhi")
	if not jishengkongzhi then
		return
	end
	local Count = jishengkongzhi.GetCustomInteger4(1)
	Count = Count + 1
	jishengkongzhi.SetCustomInteger4(1, Count)
	tplayer.PlaySfx(180, tplayer.nX, tplayer.nY + 50, 1002816, 0)
	scene.CreateNpc(18373, tplayer.nX, tplayer.nY + 50, 1002816, 0, -1, "jishengxiaoguai" .. Count)
	local Count = jishengkongzhi.GetCustomInteger4(1)
	Count = Count + 1
	jishengkongzhi.SetCustomInteger4(1, Count)
	tplayer.PlaySfx(180, tplayer.nX, tplayer.nY - 50, 1002816, 0)
	scene.CreateNpc(18373, tplayer.nX, tplayer.nY - 50, 1002816, 0, -1, "jishengxiaoguai" .. Count)
	--local Count = jishengkongzhi.GetCustomInteger4(1)
	--Count = Count + 1
	--jishengkongzhi.SetCustomInteger4(1, Count)
	--tplayer.PlaySfx(180, tplayer.nX + 50, tplayer.nY, 1002816, 0)
	--scene.CreateNpc(17737, tplayer.nX + 50, tplayer.nY, 1002816, 0, -1, "jishengxiaoguai" .. Count)

	--local Count = jishengkongzhi.GetCustomInteger4(1)
	--Count = Count + 1
	--jishengkongzhi.SetCustomInteger4(1, Count)
	--tplayer.PlaySfx(161, tplayer.nX, tplayer.nY - 50, 1002816, 0)
	--scene.CreateNpc(17737, tplayer.nX, tplayer.nY - 50, 1002816, 0, -1, "jishengxiaoguai" .. Count)
	local playerlist = scene.GetAllPlayer()
	
	if playerlist then
		for i = 1, #playerlist do
			if playerlist[i] ~= dwCharacterID then
				local playerTarget = GetPlayer(playerlist[i])
				local Ppdistance = GetCharacterDistance(playerlist[i], dwCharacterID)
					if playerTarget and Ppdistance <= 192 then
						if playerTarget.nMoveState ~= MOVE_STATE.ON_DEATH and playerTarget.GetBuff(3971, 2) == nil then
							playerTarget.AddBuff(0, 99, 3971, 2)
						end
					end
			end
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com