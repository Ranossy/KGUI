---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_ʷ����_��.lua
-- ����ʱ��:	2014/3/7 16:55:04
-- �����û�:	wangpengfei1
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSrcID)
	local npcBoss = GetNpc(dwCharacterID)
	if not npcBoss then
		return
	end
	local scene = npcBoss.GetScene()
	if not scene then
		return
	end
	--npcBoss.Yell("����������Ѱ��·~��")
	local tplayer = scene.GetAllPlayer()
	if tplayer then
		for i = 1, #tplayer do
			local playerthis = GetPlayer(tplayer[i])
			if playerthis then
				playerthis.Die()
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com