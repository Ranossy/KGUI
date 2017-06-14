---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��彣ʽ_�׹��ɽ.lua
-- ����ʱ��:	2013/8/21 11:15:09
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_�׹��ɽ.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��彣ʽ
-- ��������  :  �׹��ɽ
-- ����Ч��  :  ����ɽ־��������÷Ϊ�ޣ��Ժ�Ϊ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 20, nDamageBase = 20, nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 27, nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 34, nDamageRand = 4}, -- Level 3 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 41, nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 48, nDamageRand = 6}, -- Level 5 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 55, nDamageRand = 7}, -- Level 6 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 62, nDamageRand = 7}, -- Level 7 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 69, nDamageRand = 8}, -- Level 8 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 76, nDamageRand = 9}, -- Level 9 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 83, nDamageRand = 9}, -- Level 10 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 90, nDamageRand = 10}, -- Level 11
	{nAddRage = 0, nCostRage = 20, nDamageBase = 97, nDamageRand = 11}, -- Level 12
	{nAddRage = 0, nCostRage = 20, nDamageBase = 104, nDamageRand = 11}, -- Level 13
	{nAddRage = 0, nCostRage = 20, nDamageBase = 111, nDamageRand = 12}, -- Level 14
	{nAddRage = 0, nCostRage = 20, nDamageBase = 118, nDamageRand = 13}, -- Level 15
	{nAddRage = 0, nCostRage = 20, nDamageBase = 125, nDamageRand = 14}, -- Level 16
	{nAddRage = 0, nCostRage = 20, nDamageBase = 132, nDamageRand = 14}, -- Level 17
	{nAddRage = 0, nCostRage = 20, nDamageBase = 139, nDamageRand = 15}, -- Level 18

};           
             
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_FORWARD,
		12, --12frames,�ٶ�Ϊ80��������Ϊ15��
		80
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/�ؽ�_��彣ʽ_�׹��ɽ.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1694,
		1
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1695,
		1
	);--��ӻ�����������Buff
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1953,
		1
	);--��Ӵ�ϼ��ܶ���������Buff
	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	
	skill.SetNormalCoolDown(1, 337);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostRage = tSkillData[dwSkillLevel].nCostRage;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 80;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 8 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 0;
	--skill.nPrepareFrames    = 32;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	----------------- ���˴��������� -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local i = 0
	if player.IsSkillRecipeActive(1569, 1) then
		i = i + 1
	end
	if player.IsSkillRecipeActive(1570, 1) then
		i = i + 1
	end
	if i ~= 0 then
		player.AddBuff(dwCharacterID, player.nLevel, 6540, i, 1)
	end
	
	ModityCDToUI(player, 1596, 0, 0)
end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com