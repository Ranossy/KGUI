---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�ܳ�_��;�Ż���.lua
-- ����ʱ��:	2014/9/26 14:19:44
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.CastSkill(13207, 1)
	--player.PlaySfx(331, 0, 0, 0)
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com