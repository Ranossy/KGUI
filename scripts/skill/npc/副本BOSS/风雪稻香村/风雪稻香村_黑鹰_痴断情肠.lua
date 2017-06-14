---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_黑鹰_痴断情肠.lua
-- 更新时间:	2014/4/17 17:01:19
-- 更新用户:	wangpengfei1
-- 脚本说明:
----------------------------------------------------------------------<

function Apply(dwCharacterID)
	local playerthis = GetPlayer(dwCharacterID)
	if not playerthis then
		return
	end
	local scene = playerthis.GetScene()
	if not scene then
		return
	end
	local npcBoss = scene.GetNpcByNickName("heiying")
	if not npcBoss then
		return
	end
	if playerthis.GetBuff(7376, 1) then
		local buff = playerthis.GetBuff(7376, 1)
		if buff then
			local nID = buff.nCustomValue
			if nID then
				local playerKiss = GetPlayer(nID)
				if playerKiss then
					local nDis = GetCharacterDistance(playerthis.dwID, playerKiss.dwID) / 64
					local nLifeless = 0
					if scene.dwMapID == 177 then
						nLifeless = math.sqrt(nDis) * playerthis.nMaxLife * 0.02
					else
						nLifeless = math.sqrt(nDis) * playerthis.nMaxLife * 0.03
					end
					nLifeless = math.ceil(nLifeless)
					if playerthis.nCurrentLife <= nLifeless then
						playerthis.Die()
					else
						playerthis.nCurrentLife = playerthis.nCurrentLife - nLifeless
					end
					playerthis.CastSkill(9018, 1, TARGET.PLAYER, playerKiss.dwID)
				end
			end
		end
	else
		local buff = playerthis.GetBuff(7377, 1)
		if buff then
			local nID = buff.nCustomValue
			if nID then
				local playerKiss = GetPlayer(nID)
				if playerKiss then
					local nDis = GetCharacterDistance(playerthis.dwID, playerKiss.dwID) / 64
					local nLifeless = 0
					if scene.dwMapID == 177 then
						nLifeless = math.sqrt(nDis) * playerthis.nMaxLife * 0.02
					else
						nLifeless = math.sqrt(nDis) * playerthis.nMaxLife * 0.03
					end
					nLifeless = math.ceil(nLifeless)
					if playerthis.nCurrentLife <= nLifeless then
						playerthis.Die()
					else
						playerthis.nCurrentLife = playerthis.nCurrentLife - nLifeless
					end
					playerthis.CastSkill(9018, 1, TARGET.PLAYER, playerKiss.dwID)
				end
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com