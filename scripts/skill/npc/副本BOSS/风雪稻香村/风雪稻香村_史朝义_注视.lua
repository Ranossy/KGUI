---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_ʷ����_ע��.lua
-- ����ʱ��:	2014/2/11 18:05:20
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
	local npcZK = scene.GetNpcByNickName("cikeshuabingkongzhi")
	if not npcZK then
		return
	end
	local nNum = npcZK.GetCustomInteger1(1)
	nNum = nNum + 1
	local npcCK = nil
	if scene.dwMapID == 177 then
		npcCK = scene.CreateNpc(27671, playerthis.nX, playerthis.nY, playerthis.nZ, 0, -1, "cishacike" .. nNum)
	else
		npcCK = scene.CreateNpc(36360, playerthis.nX, playerthis.nY, playerthis.nZ, 0, -1, "cishacike" .. nNum)
	end
	npcZK.SetCustomInteger1(1, nNum)
	if npcCK then
		npcCK.SetCustomInteger4(1, playerthis.dwID)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com