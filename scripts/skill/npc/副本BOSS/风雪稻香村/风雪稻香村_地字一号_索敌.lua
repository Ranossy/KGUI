---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_����һ��_����.lua
-- ����ʱ��:	2014/1/6 10:18:23
-- �����û�:	wangpengfei1
-- �ű�˵��:	
----------------------------------------------------------------------<


function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npcBOSS = scene.GetNpcByNickName("BOSS_diziyihao")
	if npcBOSS then
		npcBOSS.FireAIEvent(2011, 0, dwCharacterID)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com