---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/ݶ������ɽ/skill/����֮�.lua
-- ����ʱ��:	12/13/10 16:55:01
-- �����û�:	yule-PC
-- �ű�˵��:	
----------------------------------------------------------------------<

-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local cPlayer = GetPlayer(dwCharacterID)
		if cPlayer then
			cPlayer.AddBuff(0,99,2319,1)
		end
	end
end

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com