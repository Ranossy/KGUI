---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��ˮ����_�Ӽ���_��Ȫ�����л�Ŀ��.lua
-- ����ʱ��:	2013/5/29 20:45:15
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��ˮ����_�Ӽ���_��Ȫ�����л�Ŀ��.lua
-- ������    :  	
-- ����ʱ��  :  
-- ��;(ģ��):  
-- �书����  :  
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 10, nCostRage = 0, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1, nDashSpeed = 100}, -- Level 1 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1, nDashSpeed = 100}, -- Level 2 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1, nDashSpeed = 100}, -- Level 3 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1, nDashSpeed = 100}, -- Level 4 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1, nDashSpeed = 100}, -- Level 5 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1, nDashSpeed = 100}, -- Level 6 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1, nDashSpeed = 100}, -- Level 7 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1, nDashSpeed = 100}, -- Level 8 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1, nDashSpeed = 100}, -- Level 9 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1, nDashSpeed = 100}, -- Level 10 Dash�ٶȵ�λ ��/֡
	
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.AUTO_SELECT_TARGET,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�ؽ�/�ؽ�_��ˮ����_�Ӽ���_��Ȫ�����л�Ŀ��.lua",
		0
	);
  
	--skill.AddSlowCheckSelfBuff(1739, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.AddSlowCheckDestBuff(1738, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--skill.AddCheckSelfLearntSkill(2748, 1, 2);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 32;
	skill.nAreaRadius = 15 * LENGTH_BASE;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 15 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if not player.GetTarget() then
		return nPreResult;
	end
	local target
	local targetType, targetID = player.GetTarget()
	if GetNpc(targetID) then
		target = GetNpc(targetID)
	elseif GetPlayer(targetID) then
		target = GetPlayer(targetID)
	end
	for i = 1, 6 do
		if player.GetBuff(1739, i) and player.GetSkillLevel(2748) then
			return false
		elseif target and target.GetBuff(1738, i) and player.GetSkillLevel(2748) then
			return false
		end
	end
    
	return nPreResult;
    
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local target = player.GetSelectCharacter()
	if target == nil then
		return false
	end
	local nDirection = GetLogicDirection(target.nX - player.nX, target.nY - player.nY);
	player.TurnTo(nDirection)
	
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com