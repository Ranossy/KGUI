------------------------------------------------
-- �ļ���    : ����ϵ_���ܴ���BUFF.lua
-- ������    : CBG
-- ����ʱ��  : 2009-12-04
-- ��;(ģ��): ����
-- ��������  : ����ϵ
-- ��������  : ����
-- ����Ч��  : ����
------------------------------------------------

------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.AddBuff(0,99,1162,1,0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com