---------------------------------------------------------------------->
-- �ű�����:	scripts\skill\npc\����BOSS\������_�۷��\��������\buff\��������.lua
-- ����ʱ��:	2014/7/14 17:06:43
-- �����û�:	ZHENGYUCHAO
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Map/������_�۷��/include/��������ͨ������.lua")

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local playerSelf = GetPlayer(dwCharacterID)
	if playerSelf then
		playerSelf.SetIdentityVisiableID(0)
		RemoteCallToClient(playerSelf.dwID, "EnableColorShift", false)
		playerSelf.Die()
	end
	
end



-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com