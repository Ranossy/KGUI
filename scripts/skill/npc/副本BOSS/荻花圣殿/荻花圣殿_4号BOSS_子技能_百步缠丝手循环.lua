------------------------------------------------
-- �ļ���    :  ݶ��ʥ��_4��BOSS_�Ӽ���_�ٲ���˿��ѭ��.lua
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
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 1 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 2 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 3 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 4 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 5 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 6 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 7 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 8 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 9 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 10 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 11 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 12 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 13 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 14 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 15 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 16 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 17 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},  	-- Level 18 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 19 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 20 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 21 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 22 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 23 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 24 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 25 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 26 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 27 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 28 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200},   	-- Level 29 Dash�ٶȵ�λ ��/֡
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 200}   	-- Level 30 Dash�ٶȵ�λ ��/֡
};            
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.AUTO_SELECT_TARGET,
			0,
			0
		);
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/npc/����BOSS/ݶ��ʥ��/ݶ��ʥ��_4��BOSS_�Ӽ���_�ٲ���˿��ѭ��.lua",
			0
		);
	
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.DASH,
			tSkillData[dwSkillLevel].nDashSpeed,
			0
		);
		
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_BUFF,
			2216,
			dwSkillLevel
	 	 );
	
  
	--skill.AddSlowCheckSelfBuff(2214, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
  
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
   	--skill.nChannelInterval	= 32;
   	skill.nAreaRadius	= 40 * LENGTH_BASE;
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 40 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
    skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
	local target
	local npc = GetNpc(dwCharacterID)
	if npc then
		if not npc.GetTarget() then
			return 
		end
		local targetType , targetID = npc.GetTarget()
		if GetNpc(targetID) then
			target = GetNpc(targetID)
		elseif GetPlayer(targetID) then
			target = GetPlayer(targetID)
		end
		local nDirection = GetLogicDirection(target.nX - npc.nX, target.nY - npc.nY);
		npc.TurnTo(nDirection)
	end
end
	


function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com