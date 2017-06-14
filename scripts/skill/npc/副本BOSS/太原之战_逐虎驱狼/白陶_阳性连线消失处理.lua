---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/白陶_阳性连线消失处理.lua
-- 更新时间:	2014/9/28 20:20:38
-- 更新用户:	xueyan-pc
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Map/太原之战_逐虎驱狼/include/白陶链状表现消除.lua")

-- 当一个技能作用的时候触发, 参数为作用的对象ID
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--[[
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if BuffID == 8027 then
		local tTargetList = CheckIsDelBuff8027(scene)--白陶P1链状消除判定
		if tTargetList and #tTargetList > 0 then
			local nX = 0
			local nY = 0
			local nZ = 0
			local nNum = 0
			for i = 1, #tTargetList do
				local playerThis = GetPlayer(tTargetList[i])
				if playerThis and playerThis.GetBuff(8027, nBuffLevel) then
					playerThis.DelBuff(8027, nBuffLevel)
					nX = nX + playerThis.nX
					nY = nY + playerThis.nY
					nZ = math.max(nZ, playerThis.nZ)
					nNum = nNum + 1
				else
					MsgLog("没有找到被连线的玩家："..tTargetList[i])
				end
				playerThis = nil
			end
			local npcYBQ = scene.GetNpcByNickName("ZhHQL_BaiTao_YBQ")
			if not npcYBQ then
				scene.CreateNpc(36847, nX / nNum, nY / nNum, nZ, 0, -1, "ZhHQL_BaiTao_YBQ")
			end
		end
	end
	if BuffID == 8174 then
		local tTargetList = CheckIsDelBuff8174(scene)--白陶P1链状消除判定
		if tTargetList and #tTargetList > 0 then
			local nX = 0
			local nY = 0
			local nZ = 0
			local nNum = 0
			for i = 1, #tTargetList do
				local playerThis = GetPlayer(tTargetList[i])
				if playerThis and playerThis.GetBuff(8174, nBuffLevel) then
					playerThis.DelBuff(8174, nBuffLevel)
				end
				if playerThis then
					nX = nX + playerThis.nX
					nY = nY + playerThis.nY
					nZ = math.max(nZ, playerThis.nZ)
					nNum = nNum + 1
					playerThis = nil
				end

			end
			local npcYBQ = scene.GetNpcByNickName("ZhHQL_BaiTao_YBQ")
			if not npcYBQ then
				scene.CreateNpc(36852, nX / nNum, nY / nNum, nZ, 0, -1, "ZhHQL_BaiTao_YBQ")
			end
		end
	end
	--]]
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)

end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com