---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_��ӥ_�ն��鳦.lua
-- ����ʱ��:	2014/4/17 17:01:19
-- �����û�:	wangpengfei1
-- �ű�˵��:
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com