---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�Ӽ���_Х�绢_��Ѫս��.lua
-- ����ʱ��:	2014/12/11 11:21:22
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_Х�绢_��Ѫս��.lua
-- ������    :  ����
-- ����ʱ��  :  2008-03-5
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  Х�绢
-- ����Ч��  :  ����30%����ʹ��,�������⹦AP,�������⹦����ֵ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 0, nBuffID = 203, nBuffLevel = 1 }, -- Level 1
	{nCostMana = 0, nBuffID = 203, nBuffLevel = 2 }, -- Level 2
	{nCostMana = 0, nBuffID = 203, nBuffLevel = 3 }, -- Level 3
	{nCostMana = 0, nBuffID = 203, nBuffLevel = 4 }, -- Level 4
	{nCostMana = 0, nBuffID = 203, nBuffLevel = 5 }, -- Level 5
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_�Ӽ���_Х�绢_��Ѫս��.lua", -- ����ֵ1
		0											-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		9933, -- ����ֵ1
		1											-- ����ֵ2
	);
	--skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel)

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	--skill.SetNormalCoolDown(2, 100);

	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana = tSkillData[dwSkillLevel].nCostMana;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256

	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local dwPlayerLife = player.nCurrentLife;
	local dwPlayerMaxLife = player.nMaxLife;

	if dwPlayerLife < dwPlayerMaxLife * 0.4 then
	else
		return false;
	end

	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--������ħ������Ӧ��ʱ��ִ�нű�,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local nlev = player.GetSkillLevel(422)
	if nlev ~= 0 then
		local nTime = 10
		if player.IsSkillRecipeActive(403, 1) then
			nTime = nTime + 2
		end
		player.AddBuff(player.dwID, player.nLevel, 203, nlev, nTime)
	end
end

--������ħ�����Է�Ӧ��ʱ��ִ�нű�,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)

end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com