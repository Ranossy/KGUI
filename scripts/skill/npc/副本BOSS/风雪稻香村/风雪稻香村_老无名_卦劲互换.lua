---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_老无名_卦劲互换.lua
-- 更新时间:	2014/2/28 15:20:42
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<

function Apply(dwCharacterID,  dwSrcID)
	local playertarget = GetPlayer(dwCharacterID)
	if not playertarget then
		return
	end
	local playercaster = GetPlayer(dwSrcID)
	if not playercaster then
		return
	end
	local scene = playercaster.GetScene()
	if not scene then
		return
	end
	local npcBoss = scene.GetNpcByNickName("wuming")
	if not npcBoss then
		return
	end
	if playertarget.GetBuff(6661, 1) then			--移除死盾
		playertarget.DelBuff(6661, 1)
	end
	if playertarget.GetBuff(6661, 2) then			--移除死盾2
		playertarget.DelBuff(6661, 2)
	end
	if scene.dwMapID == 177 then
		--牵引BUFF处理
		local buffqianyin1 = playertarget.GetBuff(6666, 1)
		if buffqianyin1 then
			local nNum = buffqianyin1.nCustomValue
			playercaster.AddBuff(npcBoss.dwID, npcBoss.nLevel, 6666, 1)
			local buffqianyin2 = playercaster.GetBuff(6666, 1)
			if buffqianyin2 then
				buffqianyin2.nCustomValue = nNum
			end
			npcBoss.SetCustomInteger4(nNum, playercaster.dwID)
			playertarget.DelBuff(6666, 1)
		end
		--阴阳相生处理
		--阴（内强外弱6664）阳（内弱外强6665）
		if playertarget.GetBuff(6664, 1) and playercaster.GetBuff(6665, 1) then
			playertarget.DelBuff(6664, 1)
			playercaster.AddBuff(0, 99, 6664, 1)
			playercaster.DelBuff(6665, 1)
			playertarget.AddBuff(0, 99, 6665, 1)
		end
		if playercaster.GetBuff(6664, 1) and playertarget.GetBuff(6665, 1) then
			playercaster.DelBuff(6664, 1)
			playertarget.AddBuff(0, 99, 6664, 1)
			playertarget.DelBuff(6665, 1)
			playercaster.AddBuff(0, 99, 6665, 1)
		end
		if not playertarget.GetBuff(6664, 1) and playercaster.GetBuff(6665, 1) then
			playercaster.DelBuff(6665, 1)
			playertarget.AddBuff(0, 99, 6665, 1)
		end
		if playertarget.GetBuff(6664, 1) and not playercaster.GetBuff(6665, 1) then
			playertarget.DelBuff(6664, 1)
			playercaster.AddBuff(0, 99, 6664, 1)
		end
		if not playercaster.GetBuff(6664, 1) and playertarget.GetBuff(6665, 1) then
			playertarget.DelBuff(6665, 1)
			playercaster.AddBuff(0, 99, 6665, 1)
		end
		if playercaster.GetBuff(6664, 1) and not playertarget.GetBuff(6665, 1) then
			playercaster.DelBuff(6664, 1)
			playertarget.AddBuff(0, 99, 6664, 1)
		end
	elseif scene.dwMapID == 178 then
		--牵引BUFF处理
		local buffqianyin1 = playertarget.GetBuff(6666, 2)
		if buffqianyin1 then
			local nNum = buffqianyin1.nCustomValue
			playercaster.AddBuff(npcBoss.dwID, npcBoss.nLevel, 6666, 2)
			local buffqianyin2 = playercaster.GetBuff(6666, 2)
			if buffqianyin2 then
				buffqianyin2.nCustomValue = nNum
			end
			npcBoss.SetCustomInteger4(nNum, playercaster.dwID)
			playertarget.DelBuff(6666, 2)
		end
		--阴阳相生处理
		--阴（内强外弱6664）阳（内弱外强6665）
		if playertarget.GetBuff(6664, 1) and playercaster.GetBuff(6665, 1) then
			playertarget.DelBuff(6664, 1)
			playercaster.AddBuff(0, 99, 6664, 1)
			playercaster.DelBuff(6665, 1)
			playertarget.AddBuff(0, 99, 6665, 1)
		end
		if playercaster.GetBuff(6664, 1) and playertarget.GetBuff(6665, 1) then
			playercaster.DelBuff(6664, 1)
			playertarget.AddBuff(0, 99, 6664, 1)
			playertarget.DelBuff(6665, 1)
			playercaster.AddBuff(0, 99, 6665, 1)
		end
		if not playertarget.GetBuff(6664, 1) and playercaster.GetBuff(6665, 1) then
			playercaster.DelBuff(6665, 1)
			playertarget.AddBuff(0, 99, 6665, 1)
		end
		if playertarget.GetBuff(6664, 1) and not playercaster.GetBuff(6665, 1) then
			playertarget.DelBuff(6664, 1)
			playercaster.AddBuff(0, 99, 6664, 1)
		end
		if not playercaster.GetBuff(6664, 1) and playertarget.GetBuff(6665, 1) then
			playertarget.DelBuff(6665, 1)
			playercaster.AddBuff(0, 99, 6665, 1)
		end
		if playercaster.GetBuff(6664, 1) and not playertarget.GetBuff(6665, 1) then
			playercaster.DelBuff(6664, 1)
			playertarget.AddBuff(0, 99, 6664, 1)
		end
	end
	--换位处理
	local x1, y1, z1 = playercaster.nX, playercaster.nY, playercaster.nZ
	local x2, y2, z2 = playertarget.nX, playertarget.nY, playertarget.nZ
	playercaster.SetPosition(x2, y2, z2)
	playertarget.SetPosition(x1, y1, z1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com