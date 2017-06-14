---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/世界规则/师徒同心BUFF.lua
-- 更新时间:	2015/3/24 15:51:31
-- 更新用户:	mantong2
-- 脚本说明:	处理师徒组队增益BUFF
----------------------------------------------------------------------<

-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
----------------------------------------------------------------------<
	--以下处理监控BUFF
----------------------------------------------------------------------<
	local dwLookBuffID = 8844 								--监控BUFF
	local nLookBuffLevel = 1
	local dwFlagBuffID = 8843								--双倍BUFF
	local nFlagBufflevel = 1
	local buff_Look = player.GetBuff(dwLookBuffID, nLookBuffLevel)
	local buff_double = player.GetBuff(dwFlagBuffID, nFlagBufflevel)
	local bParty = player.IsInParty()
	local nMaxLevel = player.nMaxLevel
	local nLevel = player.nLevel
	if buff_Look then
		if nLevel == nMaxLevel then							--角色满级，return
			player.DelBuff(dwFlagBuffID, nFlagBufflevel)
			player.DelBuff(8869, 1)
			--player.DelBuff(dwLookBuffID, nLookBuffLevel)
			return
		end
		if not bParty then 									-- 不在队伍中，return
			player.DelBuff(dwFlagBuffID, nFlagBufflevel)
			player.DelBuff(8869, 1)
			--player.DelBuff(dwLookBuffID, nLookBuffLevel)	--当哥说不要自己删自己，让他自己结束吧。
			return
		end
		local nBuffEndTime = buff_Look.GetEndTime()
		local nLogicFrameCount = GetLogicFrameCount()
		local nLeftTime = math.floor((nBuffEndTime - nLogicFrameCount) / 16 / 60)
		if nLeftTime < 5 then																		--BUFF剩余时间小于1分钟，添加新BUFF
			player.AddBuff(0, 99, dwLookBuffID, nLookBuffLevel)
		end
	end
----------------------------------------------------------------------<
	--以下处理双倍BUFF
----------------------------------------------------------------------<
	local tMemberList = player.GetPartyMemberList() 		--获取队伍列表
-----------------------以下处理已有BUFF的情况-------------------------
	if buff_double then
		if bParty and #tMemberList < 1 then 					--队伍在线人数少于1
			player.DelBuff(dwFlagBuffID, nFlagBufflevel)					--删掉
			player.DelBuff(8869, 1)
		end
		for i = 1, #tMemberList do							--遍历队伍列表
			local dwMemberPlayerID = tMemberList[i]
			local MemberPlayer = GetPlayer(dwMemberPlayerID)
			local Buff_buff = player.GetBuff(2864, 1)
			local nLogicFrameCount = GetLogicFrameCount()
			local nBuffEndTime = buff_double.GetEndTime()
			local nLeftTime = math.floor((nBuffEndTime - nLogicFrameCount) / 16 / 60)
			if MemberPlayer and dwMemberPlayerID ~= dwCharacterID then
				if player.IsMyMentor(dwMemberPlayerID) or player.IsMyDirectMentor(dwMemberPlayerID) then		--师父判断
					if GetCharacterDistance(player.dwID, MemberPlayer.dwID) < 4096 then						--距离判断
						if	nLeftTime < 3 then																		--剩余时间
							player.AddBuff(0, 99, dwFlagBuffID, nFlagBufflevel)
							if not player.bNewFarmerFlag then
								player.AddBuff(0, 99, 8869, 1)
							end
							return
						end
						if not Buff_buff and not player.bNewFarmerFlag then
							player.AddBuff(0, 99, 8869, 1)
							return
						end
						return
					end
				end
			end
		end
		player.DelBuff(dwFlagBuffID, nFlagBufflevel)						--删掉
		player.DelBuff(8869, 1)
	else
--------------------以下处理没有BUFF的情况---------------------------
		if bParty and #tMemberList > 1 then
			for i = 1, #tMemberList do							--遍历队伍列表
				local dwMemberPlayerID = tMemberList[i]
				local MemberPlayer = GetPlayer(dwMemberPlayerID)
				if MemberPlayer and dwMemberPlayerID ~= dwCharacterID then
					if player.IsMyMentor(dwMemberPlayerID) or player.IsMyDirectMentor(dwMemberPlayerID) then		--师父判断
						if GetCharacterDistance(player.dwID, MemberPlayer.dwID) < 4096 then						--距离判断
							player.AddBuff(0, 99, dwFlagBuffID, nFlagBufflevel)
							if not player.bNewFarmerFlag then
								player.AddBuff(0, 99, 8869, 1)
							end
							return
						end
					end
				end
			end
		end
	end
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com