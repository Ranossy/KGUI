---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/90����Ѩ/������ʵ���˺�.lua
-- ����ʱ��:	2013/5/10 11:47:08
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�����﷨_����.lua
-- ������    :  �ź�	
-- ����ʱ��  :  2011-04-11
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  �����﷨
-- ��������  :  ����
-- ����Ч��  :  ������������Ŀ��ʩ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 140, nDamageRand = 10, nLevel = 1, nCostMana = 57, nDebuffLevel = 1}, 
};



--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
	    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/90����Ѩ/������ʵ���˺�.lua", -- ����ֵ1
		0														-- ����ֵ2
	);

	--skill.BindBuff(1, 3465, 1)  --�����
	
	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	--skill.SetNormalCoolDown(1, 436);
	--skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 80;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nMinPrepareFrames = 1;
	skill.nWeaponDamagePercent = 0;
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 30 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nPrepareFrames = 8;										--����֡��,16֡����1��
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
	skill.nChannelInterval = 160; 									-- ͨ�������ʱ�� 
	skill.nBreakRate = 1024;									--���ʩ������
  
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult 
	end
	local target = player.GetSelectCharacter()
	if target == nil then
		return false
	end
	local nTargetDirection = GetLogicDirection(target.nX - player.nX, target.nY - player.nY);
	local nPlayerDirection = player.nFaceDirection
	local nDirectionA = math.mod(nTargetDirection + 64 + 256, 256)
	local nDirectionB = math.mod(nTargetDirection-64 + 256, 256)

	if nPlayerDirection > nDirectionA or nPlayerDirection < nDirectionB then
		player.TurnTo(math.mod(nTargetDirection + 128, 256))
		return nPreResult;
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
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.ResetCD(436)
	player.CastSkill(6529, 1)
	player.CastSkill(13778, 1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com