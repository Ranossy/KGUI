---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�ܳ�_�ͷŻ���.lua
-- ����ʱ��:	2014/9/26 14:21:56
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)

end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
		local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.CastSkill(13206, 1)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com