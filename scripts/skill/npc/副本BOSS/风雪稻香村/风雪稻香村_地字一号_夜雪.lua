---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_����һ��_ҹѩ.lua
-- ����ʱ��:	2014/2/18 10:06:44
-- �����û�:	wangpengfei1
-- �ű�˵��:	
----------------------------------------------------------------------<

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local playerthis = GetPlayer(dwCharacterID)
	if not playerthis then
		return
	end
	local scene = playerthis.GetScene()
	if not scene then
		return
	end
	local npcBOSS = scene.GetNpcByNickName("BOSS_diziyihao")
	if npcBOSS then
		local nNum = npcBOSS.GetCustomInteger1(5)
		nNum = nNum + 1
		if scene.dwMapID == 177 then
			scene.CreateNpc(26120, playerthis.nX, playerthis.nY, playerthis.nZ, 0, -1, "yexue_" .. nNum)
		else
			scene.CreateNpc(36300, playerthis.nX, playerthis.nY, playerthis.nZ, 0, -1, "yexue_" .. nNum)
		end
		npcBOSS.SetCustomInteger1(5, nNum)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com