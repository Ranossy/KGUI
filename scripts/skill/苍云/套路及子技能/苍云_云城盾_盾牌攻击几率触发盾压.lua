---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/����_�ƳǶ�_���ƹ������ʴ�����ѹ.lua
-- ����ʱ��:	2014/9/18 14:40:55
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--��ѹ����5%���������ؼ�
	local nRecipeCount = 0
	if player.IsSkillRecipeActive(1858, 1) then
		nRecipeCount = nRecipeCount + 1
	end
	if player.IsSkillRecipeActive(1859, 1) then
		nRecipeCount = nRecipeCount + 1
	end
	
	--local Parry = ((player.nParry * 0.0111) + 3 ) * 100
	local Parry = (((player.nParry / (player.nParry + 2.237 * 775)) * 100 + 3)) * 100
	local nSkill= player.GetKungfuMount()
	if nSkill ~= nil then
		--��ɽ���ķ���3�������мܼ��ʵļ��ʴ�����ѹ
		if nSkill.dwSkillID == 10390 then
			local nNum = Random(10000)
			if nNum <= (Parry * 2 + 5 * nRecipeCount * 100) then
				player.ClearCDTime(802)
			end
		end
		--�������ķ���1�������мܼ��ʵļ��ʴ�����ѹ
		if nSkill.dwSkillID == 10389 then
			local nNum = Random(10000)
			if nNum <= (Parry * 1 + 5 * nRecipeCount * 100) then
				player.ClearCDTime(802)
			end
		end		
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com