---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ṧ/�˴���/����/����BUFF���_DOT.lua
-- ����ʱ��:	2016/4/21 3:32:42
-- �����û�:	zhangyan-pc
-- �ű�˵��:	--��ͷʵ�ⱸע��һ��BUFF��ÿ���ű��е�Apply ������ÿ��ʱ�򴥷�
--��ͷʵ�ⱸע��һ��BUFF��ÿ���ű��е�UnApply ��������Ч��
----------------------------------------------------------------------<

--��ͷʵ�ⱸע��һ��BUFF��ÿ���ű��е�Apply ������ÿ��ʱ�򴥷�
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.bOnHorse then
		return
	end

	if player.bSprintFlag then
		local buffid_no = 10695 
		local buffid_yes = 10694

		local buff_no = player.GetBuff(buffid_no, 1)
		local buff_yes = player.GetBuff(buffid_yes, 1)
		
		if not buff_no then

			if not buff_yes then

				player.AddBuff(0, 99, buffid_yes, 1, 60)
			end
		end
	end
end

-- ��ͷʵ�ⱸע��һ��BUFF��ÿ���ű��е� UnApply ��������Ч��
function UnApply(dwCharacterID)
	--��Ч
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com