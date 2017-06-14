---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ӣ������_�һ�ת��.lua
-- ����ʱ��:	2013/11/27 16:13:34
-- �����û�:	liguanghao2
-- �ű�˵��:	
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	
	local npcLeilangZK = scene.GetNpcByNickName("leilangzongkong")
	local nLanghun = 0
	if npcLeilangZK then
		nLanghun = npcLeilangZK.GetCustomInteger4(29)
	end
	
	local npcBoss = scene.GetNpcByNickName("leilang")
	if npcBoss then
		if nLanghun == 0 then
			local npcLeilangZK = scene.GetNpcByNickName("leilangzongkong")
			if npcLeilangZK then
				npcLeilangZK.SetCustomInteger4(29, 0)
			end
			return
		elseif nLanghun == 1 then
			npcBoss.AddBuff(0, 99, 7034, 2)
			local npcLeilangZK = scene.GetNpcByNickName("leilangzongkong")
			if npcLeilangZK then
				npcLeilangZK.SetCustomInteger4(29, 0)
			end
		elseif nLanghun == 2 then
			local npcLeilangZK = scene.GetNpcByNickName("leilangzongkong")
			if npcLeilangZK then
				npcLeilangZK.SetCustomInteger4(29, 0)
			end
			npcBoss.AddBuff(0, 99, 7034, 2)
			npcBoss.AddBuff(0, 99, 7034, 2)
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end	

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com