---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/��������������_���esc��ȡ���ͷ�.lua
-- ����ʱ��:	2016/8/22 11:23:35
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		--if player.GetOTActionState() ~= 1 or player.GetOTActionState() ~= 2 then
			--print("222222")
			--player.DelBuff(10521, 1)
		--end

		if player.GetOTActionState() ~= 2 then
			player.DelBuff(10521, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com